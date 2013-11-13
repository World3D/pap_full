--��Ҫ���ż�

--MisDescBegin
x205001_g_ScriptId = 205001
x205001_g_MissionIdPre =40
x205001_g_MissionId = 41
x205001_g_MissionKind = 11
x205001_g_MissionLevel = 55
--x205001_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x205001_g_Name	="��ɽ" 
x205001_g_Name2	="�ٲ�̨" 
x205001_g_DemandItem ={{id=13010006,num=1}}
x205001_g_noDemandKill ={{id=301,num=1}}	

x205001_g_MissionName="��Ҫ���ż�"
x205001_g_MissionInfo="    <�������㣬���ŵ��ų���ɽһ���԰ף���ߵ���Щʬ���Ǹ�������������Ѻ����ˣ���������Ѻ�˵���Щ��ƥ�ͻ���Ѿ������������ߡ�>\n \n    ��������30��45�����ˣ����ù��ң���һ��Ҫ׷����Щ�����������ǵĻ��������������Ϊ������Щ����������һ�����Ҫ���ţ�һ��Ҫ�û���������#G�ٲ�̨#W��������"  --��������
x205001_g_MissionTarget="    ɱ��#R�Ӵܵĵ���#W��30��45������#c0080C0��Ҫ����#W�Ÿ�������������#G�ٲ�̨#W������"		
x205001_g_MissionComplete="    �Һ�����İ�æ�������ǧ���ܶ�ʧ��"					--�������npc˵���Ļ�
x205001_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x205001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205001_g_RadioItemBonus={}

--MisDescEnd
x205001_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205001_g_MissionId) > 0 then
		if x205001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205001_g_MissionName)
			AddText(sceneId,x205001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205001_g_MissionTarget) 
			AddText(sceneId,format("\n    ��Ҫ����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205001_g_DemandItem[1].id),x205001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205001_g_MissionName)
		     AddText(sceneId,x205001_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x205001_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205001_g_ScriptId, x205001_g_MissionId)
                end

        elseif x205001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205001_g_MissionName)
                AddText(sceneId,x205001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205001_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205001_g_ScriptId, x205001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205001_g_ScriptId, x205001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	if (GetName(sceneId,targetId)==x205001_g_Name) then
        	       if IsMissionHaveDone(sceneId, selfId, x205001_g_MissionIdPre) > 0 then
        	            if IsHaveMission(sceneId,selfId, x205001_g_MissionId)<= 0 then
        	            	return 1
        	            end
        	       end
        	end
		if (GetName(sceneId,targetId)==x205001_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x205001_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205001_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205001_g_MissionId, x205001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x205001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205001_g_MissionId)
	for i, item in pairs(x205001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205001_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x205001_g_DemandItem[1].id) == x205001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205001_g_MissionId)
		AddExp(sceneId, selfId, x205001_g_ExpBonus)
		AddMoney(sceneId, selfId, x205001_g_MoneyBonus)
		for i, item in pairs(x205001_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x205001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205001_g_MissionId) >= 0 then                                       
       		 if objdataId == x205001_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x205001_g_DemandItem[1].id) < x205001_g_DemandItem[1].num then
       		         if random(1,100)>90 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x205001_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��Ҫ����   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205001_g_DemandItem[1].id)+1,x205001_g_DemandItem[1].num )) 
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

function x205001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205001_OnItemChanged(sceneId, selfId, itemdataId)

end

