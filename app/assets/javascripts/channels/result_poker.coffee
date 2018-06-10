App.poker_member = App.cable.subscriptions.create "ResultPokerChannel",
  disconnected: ->
  received: (data) ->
    for id, index in data.choose_card_ids
      $("#member-card-name-" + id).text "#{data.choose_card_names[index]}"
    $("li.result.card").attr('id', 'selected')
    if data.suggested != null
      $(".suggested").html "<span>suggested:</span> #{data.suggested}"
    $("li:contains('Go Choose Card')").text ''