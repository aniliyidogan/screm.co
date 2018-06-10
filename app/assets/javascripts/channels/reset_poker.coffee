App.poker_member = App.cable.subscriptions.create "ResetPokerChannel",
  disconnected: ->
  received: (data)->
    $(".suggested").text ''
    $("#member-cards").html ''
    document.location.href = '/'