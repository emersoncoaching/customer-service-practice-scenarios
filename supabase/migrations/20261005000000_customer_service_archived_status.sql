begin;

alter table public.customer_service_scenario_submissions
  drop constraint if exists customer_service_scenario_submissions_review_status_check;

alter table public.customer_service_scenario_submissions
  add constraint customer_service_scenario_submissions_review_status_check
  check (review_status in ('open', 'accepted', 'rejected', 'archived'));

create or replace function public.set_customer_service_submission_review_status(
  p_review_token text,
  p_review_status text
)
returns table (
  candidate_name text,
  candidate_email text,
  starhire_candidate_id text,
  created_at timestamptz,
  responses jsonb,
  scenario_version text,
  review_status text,
  reviewed_at timestamptz,
  starhire_rejected_at timestamptz,
  starhire_reject_verified_at timestamptz,
  starhire_rejected_stage_id text,
  starhire_reject_error text
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_review_status text := lower(trim(coalesce(p_review_status, '')));
begin
  if v_review_status not in ('open', 'accepted', 'rejected', 'archived') then
    raise exception 'Review status must be open, accepted, rejected, or archived.';
  end if;

  return query
    update public.customer_service_scenario_submissions as submissions
    set
      review_status = v_review_status,
      reviewed_at = case when v_review_status = 'open' then null else now() end
    where submissions.review_token = p_review_token
    returning
      submissions.candidate_name,
      submissions.candidate_email,
      submissions.starhire_candidate_id,
      submissions.created_at,
      submissions.responses,
      submissions.scenario_version,
      submissions.review_status,
      submissions.reviewed_at,
      submissions.starhire_rejected_at,
      submissions.starhire_reject_verified_at,
      submissions.starhire_rejected_stage_id,
      submissions.starhire_reject_error;

  if not found then
    raise exception 'Review response not found.';
  end if;
end;
$$;

commit;
