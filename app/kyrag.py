from ahserver.webapp import webapp
from ahserver.serverenv import ServerEnv
from appbase.init import load_appbase
from rbac.init import load_rbac
from filemgr.init import load_filemgr
from rag.init import load_rag

def init():
	load_appbase()
	load_rbac()
	load_filemgr()
	load_rag()

if __name__ == "__main__":
	webapp(init)

