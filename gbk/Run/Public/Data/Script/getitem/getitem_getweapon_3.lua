x950008_g_ScriptId = 950008

--�����Ƕ�̬**************************************************************

--�����ı�����
x950008_g_MissionName="������������"


x950008_g_Items	=	{
										{
											{
											}
										},
										{
											{
											}
										},
										{
											{
											}
										},
										{
											{
											}
										},
										{
											{
											}
										},
										{
											{
											}
										}
									}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950008_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	local ret;
	local zhiye = GetMenPai(sceneId, selfId);
	local itemcount = 0;
		
	BeginAddItem(sceneId);
	for i, items in pairs(x950008_g_Items[zhiye+1]) do
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
function x950008_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950008_g_ScriptId,x950008_g_MissionName);
end