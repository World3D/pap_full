--��ҽ���һ�� area ʱ����
function x930001_OnEnterArea( sceneId, monsterobjid )

end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x930001_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x930001_OnLeaveArea( sceneId, monsterobjid )

end


function x930001_OnDefaultEvent( sceneId, monsterobjid )

end

function x930001_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 920000, "MonsterNum",sceneId, monsterobjid , targetId )
end
