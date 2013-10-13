init_new_schedule = ->
	row =  $('tr')[1]
	td = $(row).children('td').first()
	$(td).children('.subject').html('Предмет')
	$(td).children('.lecturer').html('Преподаватель/группа')
	$(td).children('.auditory').html('Аудитория')
	return 0

scheduleAsHTML = ->
		$('div[contenteditable=true]').each ->
			$(@).removeAttr 'contenteditable'
		$('table.shcedule').prop('outerHTML')

new_check_data = ->
	name = $('#schedule_name').val()
	type = $('#schedule_sch_type').val()
	if name isnt "" and type isnt ""
		$('#schedule_body').val scheduleAsHTML()
		$('form').submit()	
	else
		 $('#schedule_name').parent().addClass('error')	
	return 0

init_schedule_edition = ->
	$('td > div').each ->
		$(@).attr 'contenteditable','true'
	$('#edit-schedule')
		.unbind('click',init_schedule_edition)
		.click(save_schedule)
	$(@).html "Сохранить"

save_schedule = ->
	btn = @
	body = scheduleAsHTML()
	$.ajax
		url: "/schedules/#{sheduleID}"
		context: document.body
		type: "post"
		data:
			"_method": 'PATCH'
			"schedule[body]": body
		success: ->
			$(btn).html "Редактировать"
			$(".alert").alert()
			$(".alert").show()
			$('#edit-schedule')
				.unbind('click',save_schedule)
				.click(init_schedule_edition)
			$('#close').click ->
				$(".alert").alert('close')

$(document).ready ->
	page = $('div#page').html()
	if page is "new_schedule"
		init_new_schedule()
		$('#add_schedule').click new_check_data
	else if page is 'show_schedule'
		$('#edit-schedule').click init_schedule_edition

