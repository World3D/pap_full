--����ǧ���˲�

--MisDescBegin
x212001_g_ScriptId = 212001
x212001_g_MissionIdPre =247
x212001_g_MissionId = 248
x212001_g_MissionKind = 17
x212001_g_MissionLevel = 70
x212001_g_ScriptIdNext = {ScriptId = 212002 ,LV = 1 }
x212001_g_Name	="�ٲ�̨" 
x212001_g_Name2	="�ɼ�˼��" 
x212001_g_DemandItem ={{id=13010053,num=1}}
x212001_g_noDemandKill ={{id=421,num=1}}	

x212001_g_MissionName="����ǧ���˲�"
x212001_g_MissionInfo="    ��Χ����������δ�����������ǳ����ģ�Ϊ�˼�ҹʧ�ߡ�ֻ��ս�·�æ�����ܳ����뿪��Ϊ�ɶ�ɱ���ˣ��Ա�������\n \n    "  --��������
x212001_g_MissionInfo2="�������ҵ�#c0080C0����ǧ���˲�#Wһ�꣬�͵��ɿڸ��󺹣������˲Σ���#G�������#W��������#R����ˮ��ͳ����#W�Ͼ��С�"
x212001_g_MissionTarget="    ��#G�������#W��������#R����ˮ��ͳ��#W���ϵõ�#c0080C0����ǧ���˲�#W�������˲���ȥ��#G�ɼ�˼��#W��"		
x212001_g_MissionComplete="    �ܺã��ٲ�̨����ս�·�æ֮�ʻ��ܹ����ң�����������ġ�"					--�������npc˵���Ļ�
x212001_g_ContinueInfo="    ����ǧ���˲��أ�"
--������
x212001_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x212001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x212001_g_RadioItemBonus={}

--MisDescEnd
x212001_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x212001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x212001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x212001_g_MissionId) > 0 then
		if x212001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x212001_g_MissionName)
			AddText(sceneId,x212001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x212001_g_MissionTarget) 
			AddText(sceneId,format("\n    ����ǧ���˲�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x212001_g_DemandItem[1].id),x212001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x212001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x212001_g_MissionName)
		     AddText(sceneId,x212001_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x212001_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x212001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x212001_g_ScriptId, x212001_g_MissionId)
                end

        elseif x212001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x212001_g_MissionName)
                AddText(sceneId,x212001_g_MissionInfo..GetName(sceneId, selfId)..x212001_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x212001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x212001_g_MoneyBonus)
		EndEvent()
		DispatchMissionInfo(sceneId, selfId, targetId, x212001_g_ScriptId, x212001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x212001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x212001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x212001_g_ScriptId, x212001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x212001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x212001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x212001_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==12) then
        	if IsMissionHaveDone(sceneId, selfId, x212001_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x212001_g_Name) then
        			if IsHaveMission(sceneId,selfId, x212001_g_MissionId) <= 0 then 
        	         		return 1
        	         	end
        	        end
        	        if (GetName(sceneId,targetId)==x212001_g_Name2) then
        			if IsHaveMission(sceneId,selfId, x212001_g_MissionId) > 0 then 
        	         		return 1
        	         	end
        	        end
        	end
		
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x212001_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x212001_g_MissionId, x212001_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x212001_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x212001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x212001_g_MissionId)
	for i, item in x212001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x212001_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x212001_g_DemandItem[1].id) == x212001_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x212001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x212001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x212001_g_MissionId)
		AddExp(sceneId, selfId, x212001_g_ExpBonus)
		AddMoney(sceneId, selfId, x212001_g_MoneyBonus)
		for i, item in x212001_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x212001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x212001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end

	

	
end



--**********************************

--ɱ����������

--**********************************

function x212001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x212001_g_MissionId) >= 0 then                                       
       		 if objdataId == x212001_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x212001_g_DemandItem[1].id) < x212001_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x212001_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("����ǧ���˲�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x212001_g_DemandItem[1].id)+1,x212001_g_DemandItem[1].num )) 
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

function x212001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x212001_OnItemChanged(sceneId, selfId, itemdataId)

end

