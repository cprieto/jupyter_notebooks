print "hi"
c.NotebookApp.ip = '0.0.0.0' # listen on all IPs
c.NotebookApp.token = ''     # disable authentication
c.NotebookApp.allow_origin = '*' # allow access from anywhere
c.NotebookApp.disable_check_xsrf = True # allow cross-site requests
