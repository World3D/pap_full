--����

--MisDescBegin
x215001_g_ScriptId = 215001
x215001_g_MissionIdPre =131
x215001_g_MissionId = 132
x215001_g_MissionKind = 14
x215001_g_MissionLevel = 55
x215001_g_ScriptIdNext = {ScriptId = 215002 ,LV = 1 }
x215001_g_Name	="������" 
x215001_g_DemandItem ={{id=13010026,num=1}}
x215001_g_noDemandKill ={{id=379,num=1}}	

x215001_g_MissionName="����"
x215001_g_MissionInfo="    <����ע�����㣬���������ƺ��ܿ��������>\n \n    "  --��������
x215001_g_MissionInfo2="����һ��Ӣ�ۣ��Ҳ������㣬����ʵ������ǻ�����ģ�۹����¹�����\n \n    ���ټ��Ĳ����Ѿ�½���ۼ������������Զ�����ɹ������һ��ս����ս���ϣ�Ψһ��������ǣ�˭��ʵ����ǿ��˭���ܻ���ȥ��ʤ��Ϊ����\n \n    ��Ҫ���ɼ�˼��������Ӣ�ۣ���ʹ���������ĵ��£���ҲԸ�⡣���ǣ���Щ�ټ������ˣ�����ҹ����ı�����������ҵ��Ȼʵ���������һ�ж��ð��ˡ�\n \n    #c0080C0����#Wһֱ��#R̩��#W�������ܣ������˱���֮�ģ���һ��Ҫ������������"
x215001_g_MissionTarget="    ����ʿ���ŵ�פ�ش��#R̩��#W�����������õ�#c0080C0����#W������#G������#W��"		
x215001_g_MissionComplete="    ̫��л���ˣ����������ҷǳ���Ҫ��"					--�������npc˵���Ļ�
x215001_g_ContinueInfo="    �������Һ���Ҫ����һ��Ҫ��̩�˵������û�����"
--������
x215001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215001_g_RadioItemBonus={}

--MisDescEnd
x215001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215001_g_MissionId) > 0 then
		if x215001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215001_g_MissionName)
			AddText(sceneId,x215001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215001_g_MissionTarget) 
			AddText(sceneId,format("\n    ����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215001_g_DemandItem[1].id),x215001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215001_g_MissionName)
		     AddText(sceneId,x215001_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x215001_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x215001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215001_g_ScriptId, x215001_g_MissionId)
                end

        elseif x215001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215001_g_MissionName)
                AddText(sceneId,x215001_g_MissionInfo..GetName(sceneId, selfId)..x215001_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215001_g_ScriptId, x215001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215001_g_ScriptId, x215001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId, selfId, x215001_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215001_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x215001_g_MissionId, x215001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x215001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x215001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215001_g_MissionId)
	for i, item in x215001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215001_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x215001_g_DemandItem[1].id) == x215001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215001_g_MissionId)
		AddExp(sceneId, selfId, x215001_g_ExpBonus)
		AddMoney(sceneId, selfId, x215001_g_MoneyBonus)
		for i, item in x215001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x215001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x215001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215001_g_MissionId) >= 0 then                                       
       		 if objdataId == x215001_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x215001_g_DemandItem[1].id) < x215001_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x215001_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215001_g_DemandItem[1].id)+1,x215001_g_DemandItem[1].num )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x215001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215001_OnItemChanged(sceneId, selfId, itemdataId)

end

