

x300455_g_ScriptId = 300455
x300455_g_TransScriptId = 800019
x300455_g_TransPos="dadutongwangbianjing"


--��ҽ���һ�� area ʱ����
function x300455_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300455_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300455_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300455_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300455_OnLeaveArea( sceneId, monsterobjid )

end


function x300455_OnDefaultEvent( sceneId, monsterobjid )

end

