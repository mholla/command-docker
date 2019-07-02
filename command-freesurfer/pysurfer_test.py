from surfer import Brain

subj_dir = '/usr/local/freesurfer/subjects'
subject = 'fsaverage'
hemi = 'lh'
surf = 'inflated'

brain = Brain(subject, hemi, surf, subjects_dir=subj_dir)
    
brain.show_view('lat')
brain.save_image("pysurfer_test.png" )