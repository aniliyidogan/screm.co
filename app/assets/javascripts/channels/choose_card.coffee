App.choose_card = App.cable.subscriptions.create "ChooseCardChannel",
  connected: ->
  disconnected: ->
  received: (data) ->
    if ($("#member-card-name-#{data.id}").length == 0)
      $("#member-cards").prepend "#{data.member_card_partial}"
