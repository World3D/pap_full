--��ľ

--MisDescBegin
x206005_g_ScriptId = 206005
x206005_g_MissionIdPre =31
x206005_g_MissionId = 32
x206005_g_MissionKind = 8
x206005_g_MissionLevel = 40
x206005_g_ScriptIdNext = {ScriptId = 206006 ,LV = 1 }
x206005_g_Name	="��³" 
x206005_g_DemandItem ={{id=13010047,num=3}}


x206005_g_MissionName="��ľ"
x206005_g_MissionInfo="    ��֪��Ϊ�Σ�#G��³#W��#R������#W�ƺ��и�����ĸ��飬��Ȼ��Ϊ#Gľ����#W������Ѿ���ɱ��#R������#W������#G��³#Wȴ���ҵ��ɳ��ˣ�\n \n    #G��³#W������#Gľ����#W˵���������£�����������ô��Ϊ�ġ�Ϊ���������Ҳ�����ӣ��Ұ�#R������#W���ѳɼ�˼��������˵�˳�������û�ие�һ�����⣬���ﷴ��¶���˱��ĺ�ʹ�ࡣ���ֱ��飬�Ӳ������������۾���\n \n    �����������Լ��ĸ��飬�⵽������ô�����أ���֪����Ϊ�����λ��������Ҫ�������Ұ���ȥ�ռ�����#c0080C0��ľ#W��Ҳ������������Ҫ�������ܻ����͸¶һ��ʲô��"  --��������
x206005_g_MissionTarget="    �ɼ�����#c0080C0��ľ#W����#G#��³#W��"		                                                                                               
x206005_g_MissionComplete="    �ޣ����죡\n \n    �Ҳ�֪���Ǹþ�̾���Ǹú��£�#G��³#W���������������Ҹо�ë���Ȼ������Ȼ����һ����Щ���ŵĶ�����\n \n    ����#R������#W����һ����Ĺ����������������ֲ��#R������#W�ķ�Ĺ�ϣ���������˵������Ĺ������������������ȥ�������¸��������ô�ˣ�������Ҫ��ʲô��\n \n    �������ҵ���ϻ��Ǵ���������Ȼ�õ�����Ϣ���࣬�������������µ�������#R������#W��û�а�����������Ǵ�һȺ#R�����Ľ��#W�����������ֻ��#G�����#W̫Ҫ���ӣ�������̫�����֪���������ܣ�������#R������#W������ȴ����ʵ���������ʵĻ����У��Ҹо������������ƺ���#R������#W�����������йء�"					--�������npc˵���Ļ�
x206005_g_ContinueInfo="    ���������ǻۣ��Һ��Ѹ�����ͣ�"
--������
x206005_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x206005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206005_g_RadioItemBonus={}

--MisDescEnd
x206005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206005_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x206005_g_Name) then
			if x206005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x206005_g_MissionName)
				AddText(sceneId,x206005_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x206005_g_MissionTarget) 
				AddText(sceneId,format("\n    ��ľ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x206005_g_DemandItem[1].id),x206005_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
                	
			     
                	if x206005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                	     BeginEvent(sceneId)
                	     AddText(sceneId,"#Y"..x206005_g_MissionName)
			     AddText(sceneId,x206005_g_MissionComplete)
			     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     	     --for i, item in pairs(x206005_g_DemandItem) do  
		     	     --AddItemBonus(sceneId, item.id, item.num)
		     	     --end
		     	     AddMoneyBonus(sceneId, x206005_g_MoneyBonus)
                	     EndEvent()
		     	     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206005_g_ScriptId, x206005_g_MissionId)
                	end
                end
                

        elseif x206005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206005_g_MissionName)
                AddText(sceneId,x206005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206005_g_ScriptId, x206005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206005_g_ScriptId, x206005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206005_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
        	if (GetName(sceneId,targetId)==x206005_g_Name) then
                	if IsMissionHaveDone(sceneId, selfId, x206005_g_MissionIdPre) > 0 then
                    		return 1
                	end
        	end
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x206005_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206005_g_MissionId, x206005_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206005_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x206005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206005_g_MissionId)
	for i, item in pairs(x206005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206005_CheckSubmit( sceneId, selfId, targetId)
	if LuaFnGetItemCount(sceneId,selfId,x206005_g_DemandItem[1].id) == x206005_g_DemandItem[1].num then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206005_g_MissionId)
		AddExp(sceneId, selfId, x206005_g_ExpBonus)
		AddMoney(sceneId, selfId, x206005_g_MoneyBonus)
		for i, item in pairs(x206005_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x206005_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x206005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206005_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x206005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206005_OnItemChanged(sceneId, selfId, itemdataId)

end

