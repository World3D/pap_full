x950004_g_ScriptId = 950004

--�����Ƕ�̬**************************************************************

--�����ı�����
x950004_g_MissionName="��ȡ��װ"


x950004_g_Items	=	{
										{
										 {id=10232302, num=1},
										 {id=10252302, num=1},
										 {id=10272302, num=1}
											--�ؼ�06
										},
										{
											{id=10232303, num=1},
											{id=10252303, num=1},
											{id=10272303, num=1},
											--�ؼ�07
											{id=10232304, num=1},
											{id=10252304, num=1},
											{id=10272304, num=1}
										--�ؼ�08
										},
										 {
											{id=10232305, num=1},
											{id=10252305, num=1},
											{id=10272305, num=1}
										--�ؼ�09
										},
										{
											{id=10232306, num=1},
										        {id=10252306, num=1},
											{id=10272306, num=1}
										--�ؼ�10
										},
									
										{
											{id=10232403, num=1},
											{id=10252403, num=1},
											{id=10272403, num=1}
										--�ؼ�����06
										},
										{											
											{id=10232404, num=1},
											{id=10252404, num=1},
											{id=10272404, num=1}
										--�ؼ�����07
										},
									        {
											{id=10232405, num=1},
											{id=10252405, num=1},
											{id=10272405, num=1}
										
										--�ؼ�����08
									        },
									        {
											{id=10232406, num=1},
											{id=10252406, num=1},
											{id=10272406, num=1}
										},
										--�ؼ�����09
										{
											{id=10232407, num=1},
											{id=10252407, num=1},
											{id=10272407, num=1}
										}
										--�ؼ�����10
									}
									
									
									

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950004_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	local ret;
	local itemcount = 0;
	
	for i, items in pairs(x950004_g_Items) do
		
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
function x950004_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950004_g_ScriptId,x950004_g_MissionName);
end