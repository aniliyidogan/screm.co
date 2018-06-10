App.poker_member = App.cable.subscriptions.create "PokerMemberChannel",
  disconnected: ->
  received: (data) ->
    $("#poker-members").prepend "#{data.poker_member_partial}"