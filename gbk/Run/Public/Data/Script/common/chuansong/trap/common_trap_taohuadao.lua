

x300461_g_ScriptId = 300461
x300461_g_TransScriptId = 800019
x300461_g_TransPos="taohuadao"


--��ҽ���һ�� area ʱ����
function x300461_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300461_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300461_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300461_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300461_OnLeaveArea( sceneId, monsterobjid )

end


function x300461_OnDefaultEvent( sceneId, monsterobjid )

end

