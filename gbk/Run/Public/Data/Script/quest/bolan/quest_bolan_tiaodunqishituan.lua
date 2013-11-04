--������ʿ��

--MisDescBegin
x226007_g_ScriptId = 226007
x226007_g_MissionIdPre =342
x226007_g_MissionId = 343
x226007_g_MissionKind = 23
x226007_g_MissionLevel = 115
x226007_g_ScriptIdNext = {ScriptId = 226008 ,LV = 1 }
x226007_g_Name	="�����ʦ" 
x226007_g_DemandItem ={{id=13010073,num=10}}
x226007_g_noDemandKill ={{id=482,num=1}}	

x226007_g_MissionName="������ʿ��"
x226007_g_MissionInfo="    �ڱ���Χ����ʿ�У���һ�Ӵ������к�ɫʮ�ּܵİ�ɫ���׵�սʿ��������������ʿ�ŵ��ˣ���˵���ǵ������ʩ�ض�������ǿ��ƽ�������޷��ӽ�����\n \n    ���Ǻܲ������������ҡ���ֻ��ҪһЩ���ϾͿ����Ƴ����ķ���������������\n \n    ��������Ҫ�����µ��ģ����ȥɱ����#R������ʿ#W��ȡ�����ǵ��ģ����Ҵ�������"  --��������
x226007_g_MissionTarget="    ��#G�����ʦ#W����10��#R������ʿ#W���ġ�"		
x226007_g_MissionComplete="    �����ʵ����ء�"					--�������npc˵���Ļ�
x226007_g_ContinueInfo="    �������µ������ƻ���������������Ӧ�ú���Ч����"
--������
x226007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x226007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226007_g_RadioItemBonus={}

--MisDescEnd
x226007_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x226007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226007_g_MissionId) > 0 then
		if x226007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x226007_g_MissionName)
			AddText(sceneId,x226007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x226007_g_MissionTarget) 
			AddText(sceneId,format("\n    ������ʿ����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x226007_g_DemandItem[1].id),x226007_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x226007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226007_g_MissionName)
		     AddText(sceneId,x226007_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x226007_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x226007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226007_g_ScriptId, x226007_g_MissionId)
                end

        elseif x226007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226007_g_MissionName)
                AddText(sceneId,x226007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226007_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x226007_g_ScriptId, x226007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226007_g_ScriptId, x226007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226007_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==22) then
        	--if IsMissionHaveDone(sceneId, selfId, x226007_g_MissionIdPre) > 0 then
        	         return 1
        	--end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x226007_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x226007_g_MissionId, x226007_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x226007_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x226007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226007_g_MissionId)
	for i, item in x226007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226007_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x226007_g_DemandItem[1].id) == x226007_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x226007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226007_g_MissionId)
		AddExp(sceneId, selfId, x226007_g_ExpBonus)
		AddMoney(sceneId, selfId, x226007_g_MoneyBonus)
		for i, item in x226007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x226007_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x226007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x226007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x226007_g_MissionId) >= 0 then                                       
       		 if objdataId == x226007_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x226007_g_DemandItem[1].id) < x226007_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x226007_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("������ʿ����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x226007_g_DemandItem[1].id)+1,x226007_g_DemandItem[1].num ))
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

function x226007_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226007_OnItemChanged(sceneId, selfId, itemdataId)

end

