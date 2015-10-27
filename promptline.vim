let g:promptline_preset = {
      \'a' : [ promptline#slices#user() ],
      \'b' : [ promptline#slices#cwd() ],
      \'z' : [ promptline#slices#vcs_branch() ],
      \'y' : [ promptline#slices#git_status() ]}
