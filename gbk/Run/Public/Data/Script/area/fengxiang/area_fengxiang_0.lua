--��ҽ���һ�� area ʱ����
function x930000_OnEnterArea( sceneId, monsterobjid )

end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x930000_OnTimer( sceneId, monsterobjid )

end

--����뿪һ�� area ʱ����
function x930000_OnLeaveArea( sceneId, monsterobjid )

end


function x930000_OnDefaultEvent( sceneId, monsterobjid )
	local ret = LuaFnDeleteMonster(sceneId, monsterobjid)
	if(ret==1) then 
		CallScriptFunction( 920000, "MonsterNum",sceneId, monsterobjid , targetId )
	end
end