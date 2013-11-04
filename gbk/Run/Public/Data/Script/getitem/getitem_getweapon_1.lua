x950006_g_ScriptId = 950006

--�����Ƕ�̬**************************************************************

--�����ı�����
x950006_g_MissionName="��������"


x950006_g_Items	=	{
										{
											{
												{id=10012201, num=1},
												{id=10012206, num=1},
												{id=10012209, num=1}
											}
										},
										{
											{
												{id=10022201, num=1}
											}
										},
										{
											{
												{id=10032201, num=1}
											}
										},
										{
											{
												{id=10042201, num=1}
											}
										},
										{
											{
												{id=10052201, num=1}
											}
										},
										{
											{
												{id=10062201, num=1}
											}
										}
									}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950006_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	local ret;
	local zhiye = GetMenPai(sceneId, selfId);
	local itemcount = 0;
		
	BeginAddItem(sceneId);
	for i, items in x950006_g_Items[zhiye+1] do
		for j, item in items do
			AddItem( sceneId, item.id, item.num );
			itemcount = itemcount + 1;
		end
	end
	ret = EndAddItem(sceneId,selfId);
	if ret > 0 and itemcount > 0 then
		AddItemListToHuman(sceneId,selfId);
	end
		
end

--**********************************
--�о��¼�
--**********************************
function x950006_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950006_g_ScriptId,x950006_g_MissionName);
end