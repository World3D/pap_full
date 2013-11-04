--׷ɱ��ͽ

--MisDescBegin
x215012_g_ScriptId = 215012
x215012_g_MissionIdPre =142
x215012_g_MissionId = 143
x215012_g_MissionKind = 14
x215012_g_MissionLevel = 55
x215012_g_ScriptIdNext = {ScriptId = 215013 ,LV = 1 }
x215012_g_Name	="������" 
x215012_g_DemandItem ={{id=13010042,num=1}}
x215012_g_noDemandKill ={{id=386,num=1}}	

x215012_g_MissionName="׷ɱ��ͽ"
x215012_g_MissionInfo="    �Ǹ�����Ļ�����ģ���죬��װͶ�������Ǵ󺹣�Ȼ����ս����ؼ���ʱ�������������ǡ�����\n \n   ����ˣ������ҵ�����#R��³#W��\n \n    <������ҧ���гݵ�˵>ɱ��������������ͷ�����û�������Ҫ��������ͷ�������ǵ���³���ϣ��������˶�֪�����������Ǵ󺹵��ˣ������³�����ô���ģ�"  --��������
x215012_g_MissionTarget="    ɱ��#R��³#W�������ǵ���ͷ�û�����#G������#W��"		
x215012_g_MissionComplete="    ��ʹ�����ˣ�����ĳ�����Ҳ��ͷ�������ꡣ"					--�������npc˵���Ļ�
x215012_g_ContinueInfo="     ��Ҫ���������ߵ���ͷ��"
--������
x215012_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x215012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x215012_g_RadioItemBonus={}

--MisDescEnd
x215012_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x215012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x215012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x215012_g_MissionId) > 0 then
		if x215012_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x215012_g_MissionName)
			AddText(sceneId,x215012_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x215012_g_MissionTarget) 
			AddText(sceneId,format("\n    ��³��ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215012_g_DemandItem[1].id),x215012_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x215012_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x215012_g_MissionName)
		     AddText(sceneId,x215012_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x215012_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x215012_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x215012_g_ScriptId, x215012_g_MissionId)
                end

        elseif x215012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x215012_g_MissionName)
                AddText(sceneId,x215012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x215012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x215012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x215012_g_ScriptId, x215012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x215012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x215012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x215012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x215012_g_ScriptId, x215012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x215012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x215012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x215012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==15) then
        	if IsMissionHaveDone(sceneId, selfId, x215012_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x215012_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x215012_g_MissionId, x215012_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x215012_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x215012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x215012_g_MissionId)
	for i, item in x215012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x215012_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x215012_g_DemandItem[1].id) == x215012_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x215012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x215012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x215012_g_MissionId)
		AddExp(sceneId, selfId, x215012_g_ExpBonus)
		AddMoney(sceneId, selfId, x215012_g_MoneyBonus)
		for i, item in x215012_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x215012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x215012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x215012_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x215012_g_MissionId) >= 0 then                                       
       		 if objdataId == x215012_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x215012_g_DemandItem[1].id) < x215012_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x215012_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��³��ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x215012_g_DemandItem[1].id)+1,x215012_g_DemandItem[1].num )) 
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

function x215012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x215012_OnItemChanged(sceneId, selfId, itemdataId)

end

