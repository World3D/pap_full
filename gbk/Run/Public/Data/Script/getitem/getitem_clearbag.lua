x950000_g_ScriptId = 950000

--�����Ƕ�̬**************************************************************

--�����ı�����
x950000_g_MissionName="��հ���"


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	for i = 0, 180 do
		local itemnum = LuaFnGetItemCountInBagPos(sceneId, selfId, i);
		if itemnum > 0 then
			LuaFnEraseItem(sceneId, selfId, i);
		end
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x950000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950000_g_ScriptId,x950000_g_MissionName);
end