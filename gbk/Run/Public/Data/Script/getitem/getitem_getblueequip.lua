x950002_g_ScriptId = 950002

--�����Ƕ�̬**************************************************************

--�����ı�����
x950002_g_MissionName="��ȡ��װ"


x950002_g_Items	=	{
										{
											{id=10202201, num=1},
											{id=10202202, num=1},
											{id=10202203, num=1},
											{id=10222201, num=1},
											{id=10222202, num=1},
											{id=10222203, num=1}
										},
										{
											{id=10232201, num=1},
											{id=10232202, num=1},
											{id=10232203, num=1},
											{id=10252201, num=1},
											{id=10252202, num=1},
											{id=10252203, num=1}
										},
										{
											{id=10272201, num=1},
											{id=10272202, num=1},
											{id=10272203, num=1}
										}
									}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950002_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	local ret;
	local itemcount = 0;
	
	for i, items in pairs(x950002_g_Items) do
		
		BeginAddItem(sceneId);
		for j, item in pairs(items) do
			AddItem( sceneId, item.id, item.num );
			itemcount = itemcount + 1;
		end
		ret = EndAddItem(sceneId,selfId);
		if ret > 0 and itemcount > 0 then
			AddItemListToHuman(sceneId,selfId);
		end
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x950002_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950002_g_ScriptId,x950002_g_MissionName);
end