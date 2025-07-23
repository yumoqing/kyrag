from ahserver.webapp import webapp
from ahserver.serverenv import ServerEnv
from appbase.init import load_appbase
from rbac.init import load_rbac
from filemgr.init import load_filemgr
from rag.init import load_rag
from dapi.init import load_dapi

def init():
	load_appbase()
	load_rbac()
	load_filemgr()
	load_rag()
	load_dapi()

if __name__ == "__main__":
	webapp(init)

