require 'json'
class SubmissionProcessJob < ApplicationJob
  queue_as :default

	def perform(id)
		submission = Submission.find(id)
	    problem = Problem.find(submission.problem_id)

	    res = "Compiling"
	    submission.update(result: res)
	    user_source_code = File.basename(submission.solution_name.to_s)
	    submission_path = File.dirname(Rails.root.to_s + "/public" +  submission.solution_name.to_s)

	    compilation = "bash -c 'ruby -wc #{user_source_code} &> compile_log'"
		
		#at 0, 'Compiling'

	    pid = Process.spawn(compilation, chdir: submission_path)
		_, status = Process.wait2(pid)

		if !status.exited? || status.exitstatus != 0
			cmp_log = nil
	      begin
	        cmp_log = File.read(submission_path + '/compile_log')
	      rescue

	      end
	      res = "Compile Error"
	      submission.update(result: res)
	      submission.update(compile_log: cmp_log)
	      #at 100, 'done'
	      return
	    end

	    cmp_log = File.read(submission_path + '/compile_log') 
	    res = "running"
	    submission.update(result: res)
	    submission.update(compile_log: cmp_log)
	    	
	    testcase_path = File.dirname(Rails.root.to_s + "/public" + problem.file_name[0].to_s)

	    for testcase in problem.file_name
	    	k = File.basename(testcase.to_s)
	    	submis_file = "../../../.." + submission.solution_name.to_s

			if(k[k.length-4..k.length] == ".inp")
				
				execution = "bash -c 'ruby #{submis_file} < #{k} &> #{k[0..k.length-5]}.outtemp'"
				diff = "bash -c 'diff #{k[0..k.length-5]}.outtemp #{k[0..k.length-5]}.out > difftemp'"
				pid = Process.spawn(execution, chdir: testcase_path)
	      		_, status = Process.wait2(pid)
	      		
	      		pid = Process.spawn(diff, chdir: testcase_path)
	      		_, status = Process.wait2(pid)
				
				dif = File.read(testcase_path + "/difftemp" )
				unless dif.empty?
					res = "Wrong Answer"
					submission.update(result: res)
					return 
				end
			end

			res = "Accepted"
			submission.update(result: res)
		end
	end
end

