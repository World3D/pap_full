

x300460_g_ScriptId = 300460
x300460_g_TransScriptId = 800019
x300460_g_TransPos="xinshoucun_02"


--��ҽ���һ�� area ʱ����
function x300460_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300460_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300460_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300460_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300460_OnLeaveArea( sceneId, monsterobjid )

end


function x300460_OnDefaultEvent( sceneId, monsterobjid )

end

