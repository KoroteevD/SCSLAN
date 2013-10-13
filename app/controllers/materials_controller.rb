 # coding: utf-8
class MaterialsController < ApplicationController

	def index
		redirect_to root_path
	end

	def aboutProfession
		@title = "Особенности профессии"
	end

	def lecturers
		@title = "Преподаватели"
	end

    def contacts
    	@title = "Контакты"
	end

	def students
		@title = "Студентам"
	end

	def distanceLearning
		@title = "Дистанционное обучение"
	end

	def methods
		@title ="Методические указания"
	end

	def scheduleL
		@title = "Расписание преподавателе"
	end

	def scheduleS
		@title = "Расписание студентов"
	end

	def aboutdepartment
		@title = "Информация о кафедре"
	end

	def scientific
		@title = "Основные направления научной деятельности кафедры СКС"
	end

	def olympics
		@title = "Конференции и олимпиады"
	end

	def matriculant
		@title = "Абитуриенту"
	end

	def subjects
		@title = "Изучаемые предметы"
	end

	def dormitories
		@title = "Общежития"
	end

	def map
		@title = "Карта ДонГТУ"
	end

	def documents
		@title = "Документы"
	end

	def groups
		@title = "Художественные коллективы"
	end

	def gallery
		@title = "Фотогаллерея"
	end

	def rest
		@title = "Отдых студентов"
	end

	def links
		@title = "Ссылки"
	end
	
end