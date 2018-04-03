task :start do
  exec 'foreman start -p 3000'
end

task :start_client do
  exec 'cd client && npm start'
end
