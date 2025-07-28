from ahserver.webapp import webapp
from ahserver.serverenv import ServerEnv
from appbase.init import load_appbase
from rbac.init import load_rbac
from filemgr.init import load_filemgr
from rag.init import load_rag
from dapi.init import load_dapi
from uapi.init import load_uapi
from bricks_for_python.init import load_pybricks

async def get_owner_orgid():
	return '0'
def get_module_dbname(m):
	return 'kyrag'

def init():
	env = ServerEnv()
	env.get_module_dbname = get_module_dbname
	env.get_owner_orgid = get_owner_orgid
	load_appbase()
	load_rbac()
	load_filemgr()
	load_rag()
	load_dapi()
	load_uapi()
	load_pybricks()

if __name__ == "__main__":
	webapp(init)

