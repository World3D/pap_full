x950001_g_ScriptId = 950001

--�����Ƕ�̬**************************************************************

--�����ı�����
x950001_g_MissionName="��ȡ��װ"


x950001_g_Items	=	{
										{
											{id=10232207, num=1},
											{id=10252207, num=1},
											{id=10272207, num=1}
										},
										--�ؼ�01
										{
										 {id=10232208, num=1},
										 {id=10252208, num=1},
										 {id=10272208, num=1}
										--�ؼ�02
										},
										{
											{id=10232209, num=1},
											{id=10252209, num=1},
											{id=10272209, num=1}
										},
										--�ؼ�03
										{
											{id=10232210, num=1},
											{id=10252210, num=1},
											{id=10272210, num=1}
										},
										--�ؼ�04
										{
											{id=10232301, num=1},
											{id=10252301, num=1},
											{id=10272301, num=1}
										--�ؼ�05
										},
										{
											{id=10232307, num=1},
											{id=10252307, num=1},
											{id=10272307, num=1}
										},
										--�ؼ�����01
										--{
											--{id=10232308, num=1},
											--{id=10252308, num=1},
											--{id=10272308, num=1}
									 --},
									 --�ؼ�����02
										{
											{id=10232310, num=1},
											{id=10252310, num=1},
											{id=10272310, num=1}
										},
										--�ؼ�����03
								  {
									    {id=10232401, num=1},
									    {id=10252401, num=1},
									    {id=10272401, num=1}
										},
										--�ؼ�����04
										{
											{id=10232402, num=1},
											{id=10252402, num=1},
											{id=10272402, num=1}
										},
									--�ؼ�����05
									{
											{id=10202201, num=1},
											{id=10202202, num=1},
											{id=10202203, num=1}
									}
										--ͷ��
									}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x950001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	local ret;
	local itemcount = 0;
	
	for i, items in pairs(x950001_g_Items) do
		
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
function x950001_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x950001_g_ScriptId,x950001_g_MissionName);
end