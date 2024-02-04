

   json.array!(@schedules) do |schedule|
    json.id schedule.id
    json.title schedule.title
    json.start_time schedule.start_time
    json.end_time schedule.end_time
    json.url schedule_path(schedule.id)
   end