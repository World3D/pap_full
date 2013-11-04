--����

--MisDescBegin
x205005_g_ScriptId = 205005
x205005_g_MissionIdPre =44
x205005_g_MissionId = 45
x205005_g_MissionKind = 11
x205005_g_MissionLevel = 55
--x205005_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x205005_g_Name	="������" 
x205005_g_DemandItem ={{id=13010005,num=5}}
x205005_g_noDemandItem ={{id=13010004,num=5}}
--x205005_g_noDemandKill ={{id=304,num=1}}	

x205005_g_MissionName="����"
x205005_g_MissionInfo="    <������ת���������˵ı۰�¶���㿴��ҧ���гݵ�˵>\n \n    �㿴���㿴����Щ�����Ļ�����ģ�ˣ���ֻ��ȥ���ܿ��˿�������������һ��������Ӧ��֪�������ǳɼ�˼���ĵܵܣ���һ��Ҫ�������ǣ�������ڣ�һ��������<�����������˰��죬�ſ�ʼ����˵������>\n \n    û����ˮ�����ǵ�һЩʿ����Ϊ���ʶ������˻þ����Һðͼ���С�Ӵ�����������Ū����ˮ�ң��ڣ�164��106������һ���ޣ����������ʢ5��ˮ�ҵ�ˮ���ɡ�"  --��������
x205005_g_MissionTarget="    ����#G������#W����5��ˮ�ң�����164��106���������ް�ˮ�Ҹ�����ˮ��"		
x205005_g_MissionComplete="    ����ˮ�����ǲ������档�������ҡ������ǳɼ�˼���ĵܵܣ���Ҳ�ǳ�����Ķ��ӣ�"					--�������npc˵���Ļ�
x205005_g_ContinueInfo="    ��������·��ȥ�����������ˣ��Ͻ�ȥ������ʢˮ�ɡ�"
--������
x205005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205005_g_RadioItemBonus={}

--MisDescEnd
x205005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205005_g_MissionId) > 0 then
		if x205005_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205005_g_MissionName)
			AddText(sceneId,x205005_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205005_g_MissionTarget) 
			AddText(sceneId,format("\n    ʢ����ˮ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205005_g_DemandItem[1].id),x205005_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205005_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205005_g_MissionName)
		     AddText(sceneId,x205005_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x205005_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205005_g_ScriptId, x205005_g_MissionId)
                end

        elseif x205005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205005_g_MissionName)
                AddText(sceneId,x205005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205005_g_ScriptId, x205005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205005_g_ScriptId, x205005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205005_g_Name) then 
			return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	if IsMissionHaveDone(sceneId, selfId, x205005_g_MissionIdPre) > 0 then
        	            	return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205005_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x205005_g_noDemandItem[1].id, x205005_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205005_g_MissionId, x205005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205005_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			AddItemListToHuman(sceneId,selfId) 
	        else                                                             
		     BeginEvent(sceneId)                                      
		     AddText(sceneId,"��Ʒ����������������������")                    
		     EndEvent(sceneId)                                        
		     DispatchMissionTips(sceneId,selfId)                      
	        end           	                                                                     
	     
end



--**********************************

--����

--**********************************

function x205005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205005_g_MissionId)
	for i, item in x205005_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end
	for i, item in x205005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205005_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x205005_g_DemandItem[1].id) == x205005_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205005_g_MissionId)
		AddExp(sceneId, selfId, x205005_g_ExpBonus)
		AddMoney(sceneId, selfId, x205005_g_MoneyBonus)
		for i, item in x205005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x205005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205005_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x205005_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x205005_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)

end

function x205005_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x205005_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
end

function x205005_OnTimer(sceneId, selfId )

end

--**********************************

--���߸ı�

--**********************************

function x205005_OnItemChanged(sceneId, selfId, itemdataId)

end

