# This is way easier than the re-implementation above
def available_files
  `git ls-tree --name-only -r -z HEAD`
end

def converted_available_files_array
  available_files.split("\u0000")
end

# Threads?
def pluck_blame_details
  blame_details = []
  file_index = 1
  total_files = converted_available_files_array.length
  converted_available_files_array.each do |filename|
    current_file_details = {}
    current_file_details[filename] = []

    current_blame = `git blame -e -t #{filename}`

    line_number = 0
    current_blame.lines do |line|
      line_details = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').split(/\s\(<|>\s+|\s\d+\) /)
      current_line_details = {
        sha: line_details[0],
        author_email: line_details[1],
        timestamp: line_details[2],
        code: line_details[3],
        line_number: line_number += 1
      }
      current_file_details[filename] << current_line_details
    end
    blame_details << current_file_details
    puts "#{file_index += 1} of #{total_files} scraped"
  end
  blame_details
end
