

x300459_g_ScriptId = 300459
x300459_g_TransScriptId = 800019
x300459_g_TransPos="yangliucun"


--��ҽ���һ�� area ʱ����
function x300459_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300459_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300459_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300459_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300459_OnLeaveArea( sceneId, monsterobjid )

end


function x300459_OnDefaultEvent( sceneId, monsterobjid )

end

