module CoursesHelper
	def webinars_path
		return "/webinars"
	end

	def enroll_path(course)
		return course_path(course) + "/enroll"
	end

	def unenroll_path(course)
		return course_path(course) + "/unenroll"
	end

	def rate_path(course)
		return course_path(course) + "/rate"
	end

	def enrollments_path(course)
		return course_path(course) + "/enrollments.xlsx"
	end

	def parse_date(date, hour=false, offset = 0)
		begin
			date = DateTime.strptime(date, hour ?  "%d/%m/%Y %H:%M" : "%d/%m/%Y")
			date = (date + (offset).minutes)
			date
		rescue
			nil
		end
	end


end 
