# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(->
  $(".add-picture").on("click", ->
    $this = $(this)
    template = $(".report-pictures li.template")
    newIndex = $(".report-pictures li.section").length
    replacePattern = new RegExp($this.data("replacePattern"), "g")

    content = template.html().replace(replacePattern, newIndex)
    addSection = $("<li></li>").html(content).addClass("section")

    addSection.insertBefore(template)
    $this.hide() if $this.data("maxItems") <= $(".report-pictures li.section").length
  )

  $("form.report").on("submit", ->
    form = $(this)
    form.find("li.template").remove()
  )

  $("form.report").on("keyup blur", "#report_title", ->
    $this = $(this)
    clearTimeout($this.data('timeoutId'))
    timeoutId = setTimeout((->
      slugSuggestion = $(".slug-suggestion")
      url = slugSuggestion.data("url").replace("-title-", $this.val())
      $.get(url, (data) ->
        if data.slug
          slugSuggestion.find(".suggestion").html(data.slug)
          slugSuggestion.show()
        else
          slugSuggestion.hide()
      )),
      500
    )
    $this.data('timeoutId', timeoutId)
  )

  $("form.report").on("click", ".slug-suggestion a", (e) ->
    e.preventDefault()
    $("#report_slug").val($(".slug-suggestion .suggestion").html())
  )
)
