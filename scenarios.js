window.CUSTOMER_SERVICE_SCENARIOS = [
  {
    id: "inbound-greeting-and-reschedule",
    title: "Inbound greeting and reschedule",
    audio: "assets/audio/inbound-greeting-and-reschedule.wav",
    prompt:
      "Listen to the call. What feedback would you give, and what would you coach this person to do differently?",
    danResponse: [
      "Call 59531",
      "",
      "Issues",
      "- Answering inbound without a proper greeting.",
      '- Asking, "Would you like me to reschedule it for another date?"',
      "- Does not choose a date while both parents are there, or make it clear that we need both parents.",
    ].join("\n"),
  },
  {
    id: "missed-reschedule-opportunity",
    title: "Missed reschedule opportunity",
    audio: "assets/audio/missed-reschedule-opportunity.wav",
    prompt:
      "Listen to the call. What feedback would you give, and what would you coach this person to do differently?",
    danResponse: [
      "Call 59334",
      "",
      "Issue",
      "- No attempt to reschedule.",
    ].join("\n"),
  },
  {
    id: "booking-both-parents",
    title: "Booking both parents",
    audio: "assets/audio/booking-both-parents.wav",
    prompt:
      "Listen to the call. What feedback would you give, and what would you coach this person to do differently?",
    danResponse: [
      "Call 58606",
      "",
      "Issues",
      "- Assuming the two-parent household, then using 'family' to describe them attending.",
      "- Did not make the default to put in a time, instead of sending a link.",
    ].join("\n"),
  },
];
