require 'open3'

# Your Python script file
python_script = 'script.py'

# Your Python script arguments
script_args = ['arg1', 'arg2', 'arg3']

# Run the Python script using open3
Open3.popen3('python', python_script, *script_args) do |stdin, stdout, stderr, wait_thr|
  # Read the script's output
  output = stdout.read

  # Handle any errors
  if !stderr.empty?
    stderr.each_line do |line|
      puts line
    end
  end
end
