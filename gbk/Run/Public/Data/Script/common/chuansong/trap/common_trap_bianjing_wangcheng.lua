

x300458_g_ScriptId = 300458
x300458_g_TransScriptId = 800019
x300458_g_TransPos="bianjingtongwangwangcheng"


--��ҽ���һ�� area ʱ����
function x300458_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300458_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300458_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300458_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300458_OnLeaveArea( sceneId, monsterobjid )

end


function x300458_OnDefaultEvent( sceneId, monsterobjid )

end

