

x300456_g_ScriptId = 300456
x300456_g_TransScriptId = 800019
x300456_g_TransPos="wangchengtongwangbianjing"


--��ҽ���һ�� area ʱ����
function x300456_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300456_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300456_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300456_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300456_OnLeaveArea( sceneId, monsterobjid )

end


function x300456_OnDefaultEvent( sceneId, monsterobjid )

end

