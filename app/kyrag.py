from ahserver.webapp import webapp
from ahserver.serverenv import ServerEnv
from appbase.init import load_appbase
from rbac.init import load_rbac
from filemgr.init import load_filemgr
from rag.init import load_rag
from dapi.init import load_dapi
from bricks_for_python.init import load_python_for_python

def get_module_dbname(m):
	return 'kyrag'

def init():
	env = ServerEnv()
	env.get_module_dbname = get_module_dbname
	load_appbase()
	load_rbac()
	load_filemgr()
	load_rag()
	load_dapi()
	load_python_for_python()

if __name__ == "__main__":
	webapp(init)

