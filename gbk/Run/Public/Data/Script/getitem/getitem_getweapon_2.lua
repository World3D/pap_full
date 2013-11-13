x950007_g_ScriptId = 950007

--�����Ƕ�̬**************************************************************

--�����ı�����
x950007_g_MissionName="��������"


x950007_g_Items	=	{
										{
											{
												{id=10072201, num=1},
												{id=10072209, num=1}
											}
										},
										{
											{
												{id=10082201, num=1}
											}
										},
										{
											{
												{id=10092201, num=1}
											}
										},
										{
											{
												{id=10102201, num=1}
											}
										},
										{
											{
												{id=10112201, num=1}
											}
										},
										{
											{
												{id=10122201, num=1}
											}
										}
									}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950007_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	local ret;
	local zhiye = GetMenPai(sceneId, selfId);
	local itemcount = 0;
		
	BeginAddItem(sceneId);
	for i, items in pairs(x950007_g_Items[zhiye+1]) do
		for j, item in pairs(items) do
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
function x950007_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950007_g_ScriptId,x950007_g_MissionName);
end