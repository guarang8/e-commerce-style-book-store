# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#jquery ($) ->
#  $("#book_<%=#{book.id}%>").draggable
#    appendTo: "#shopping_cart"
#    helper: "clone"

#  $("#shopping_cart").droppable(
#    activeClass: "ui-state-default"
#    hoverClass: "ui-state-hover"
#    accept: ":not(.ui-sortable-helper)"
#    drop: (event, ui) ->
#      $(this).find(".placeholder").remove()
#      $("#book_<%=#{book.id}%>").text(ui.draggable.text()).appendTo this
#  ).sortable
#    items: "#book_<%=#{book.id}%>:not(.placeholder)"
#    sort: ->
#      $(this).removeClass "ui-state-default"

#$ ->
#	$('.draggable').draggable()
#	$('.droppable').droppable()