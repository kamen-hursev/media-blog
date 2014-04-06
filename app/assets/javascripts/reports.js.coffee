# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(->
  $(".add-picture").on("click", ->
    $this = $(this)
    newIndex = $(".report-pictures li.section").length
    replacePattern = new RegExp($this.data("replacePattern"), "g")

    content = $(".template").html().replace(replacePattern, newIndex)
    addSection = $("<li></li>").html(content).addClass("section")

    addSection.insertBefore($(".template"))
    $this.hide() if $this.data("maxItems") <= $(".report-pictures li.section").length
  )

  $("form.report").on("submit", ->
    form = $(this)
    form.find("li.template").remove()
  )
)
