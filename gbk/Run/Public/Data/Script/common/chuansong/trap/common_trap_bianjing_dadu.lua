

x300457_g_ScriptId = 300457
x300457_g_TransScriptId = 800019
x300457_g_TransPos="bianjingtongwangdadu"


--��ҽ���һ�� area ʱ����
function x300457_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x300457_g_TransScriptId, "TransferToWorld",sceneId,selfId,x300457_g_TransPos)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x300457_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x300457_OnLeaveArea( sceneId, monsterobjid )

end


function x300457_OnDefaultEvent( sceneId, monsterobjid )

end

