

   json.array!(@schedules) do |schedule|
    json.id schedule.id
    json.title schedule.title
    json.start schedule.start
    json.end schedule.end
    json.url schedule_path(schedule.id)
   end