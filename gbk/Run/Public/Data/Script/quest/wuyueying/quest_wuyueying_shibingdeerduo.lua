--ʿ���Ķ���

--MisDescBegin
x217002_g_ScriptId = 217002
x217002_g_MissionIdPre =173
x217002_g_MissionId = 174
x217002_g_MissionKind = 6
x217002_g_MissionLevel = 30
--x217002_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x217002_g_Name	="�ܱ�" 
x217002_g_DemandItem ={{id=13010067,num=20}}
x217002_g_noDemandKill ={{id=452,num=1}}	

x217002_g_MissionName="ʿ���Ķ���"
x217002_g_MissionInfo="    ��Ϊ�����커�ӵ�սʿ��ÿ���˶�Ӧ�ü�ס�������������ٽ�����仰����Ѫ��������������������ζ������ɫ���ἤ����������Ǳ����\n \n    "  --��������
x217002_g_MissionInfo2="���벻Ҫ����������ÿ������ǵ�����ɱ������������Ķ�ͯ�����Ź���\n \n    �����ʱ���ˣ�ȼ�հɣ��ҵ�սʿ�������������ӵ������ɱ����Ӫ��\n \n    ��ס��һ�����ܷŹ��κ�һ���������Ķ�������ʹ��һֻ����һֻ��Ӭ��ҲҪ��������������\n \n    ֻ���ɺ����Ѫ���ܽ����ޣ�����Ҫ�����������ǣ���ɱ����Ӫ��ʿ�����½�ʿ�������֤����ļ�ֵ��"
x217002_g_MissionTarget="    ��#G����#Wȥս����ȡ��20ֻ#c0080C0��ʿ�Ķ���#W��#G�ܱ�#W��������֤����"		
x217002_g_MissionComplete="    ���ĺã����ǵĲ�ԭսʿ����������һ��ʮ��"					--�������npc˵���Ļ�
x217002_g_ContinueInfo="    �Ը����������������"
--������
x217002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x217002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x217002_g_RadioItemBonus={}

--MisDescEnd
x217002_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x217002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x217002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x217002_g_MissionId) > 0 then
		if x217002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x217002_g_MissionName)
			AddText(sceneId,x217002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x217002_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ʿ�Ķ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x217002_g_DemandItem[1].id),x217002_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x217002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x217002_g_MissionName)
		     AddText(sceneId,x217002_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x217002_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x217002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x217002_g_ScriptId, x217002_g_MissionId)
                end

        elseif x217002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x217002_g_MissionName)
                AddText(sceneId,x217002_g_MissionInfo..GetName(sceneId, selfId)..x217002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x217002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x217002_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x217002_g_ScriptId, x217002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x217002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x217002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x217002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x217002_g_ScriptId, x217002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x217002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x217002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x217002_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==20) then
        	if IsMissionHaveDone(sceneId, selfId, x217002_g_MissionIdPre) > 0 then
        	         return 1
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x217002_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x217002_g_MissionId, x217002_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x217002_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x217002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x217002_g_MissionId)
	for i, item in x217002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x217002_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x217002_g_DemandItem[1].id) == x217002_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x217002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x217002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x217002_g_MissionId)
		AddExp(sceneId, selfId, x217002_g_ExpBonus)
		AddMoney(sceneId, selfId, x217002_g_MoneyBonus)
		for i, item in x217002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x217002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x217002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x217002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x217002_g_MissionId) >= 0 then                                       
       		 if objdataId == x217002_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x217002_g_DemandItem[1].id) < x217002_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x217002_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��ʿ�Ķ���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x217002_g_DemandItem[1].id)+1,x217002_g_DemandItem[1].num )) 
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

function x217002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x217002_OnItemChanged(sceneId, selfId, itemdataId)

end

