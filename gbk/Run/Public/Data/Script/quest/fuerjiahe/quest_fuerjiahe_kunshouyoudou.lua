--�����̶�

--MisDescBegin
x223003_g_ScriptId = 223003
x223003_g_MissionIdPre =294
x223003_g_MissionId = 295
x223003_g_MissionKind = 20
x223003_g_MissionLevel = 100
x223003_g_ScriptIdNext = {ScriptId = 223004 ,LV = 1 }
x223003_g_Name	="�ɸ�" 
x223003_g_DemandItem ={{id=13010065,num=1}}
x223003_g_DemandKill ={{id=441,num=10}}
x223003_g_noDemandKill ={{id=442,num=1}}

x223003_g_MissionName="�����̶�"
x223003_g_MissionInfo="    ���������ղ�������ĺû��ᣬ�˳�����Ԯ�����裬���Ļ����ֱ����������𣬵����Ѿ���ȫɥʧ�����ġ�\n \n    "  --��������
x223003_g_MissionInfo2="���ñ��˵ȴ��Ǻܲ���ò�����飬�����Ӫ�ɣ���#R�˳���#W��ͷ���Ҵ���������������ߵ�#R�ղ쾫���#W���ҿɲ��뿴����������֯���ǵֿ���"
x223003_g_MissionTarget="    ��ɽ����ɱ��10��#R�ղ쾫���#W����#R�˳���#W��ͷ��#G�ɸ�#W������"		                                                                                               
x223003_g_MissionComplete="    лл����ʿ���ⳡ��Χս������ָ�ӣ�����Ҳ��ζ���Ҳ���ð�ճ�����ǰ�ˡ�������������ʿ�İ����£��ҿ��԰�ȫ��רע��ָ���Ի��ʤ����������ָ�ӹ���Ӣ�µ�սʿ�������ʤ���ı��ϣ�"					--�������npc˵���Ļ�
x223003_g_ContinueInfo="    ��û�ҵ��˳������ٶ�Ҫ�죡������˳�ŵ�������������ٶȹ�һ�������ҹ���ˡ��������֮ǰ�ѵ����͵����ǵĵ���ȥ��"
--������
x223003_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x223003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223003_g_RadioItemBonus={}

--MisDescEnd
x223003_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223003_g_MissionId)
		if x223003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223003_g_MissionName)
			AddText(sceneId,x223003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ쾫���   %d/%d\n    �˳�����ͷ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223003_g_DemandKill[1].num,LuaFnGetItemCount(sceneId,selfId,x223003_g_DemandItem[1].id),x223003_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223003_g_MissionName)
		     AddText(sceneId,x223003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223003_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223003_g_ScriptId, x223003_g_MissionId)
                end

        elseif x223003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223003_g_MissionName)
                AddText(sceneId,x223003_g_MissionInfo..GetName(sceneId, selfId)..x223003_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223003_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223003_g_ScriptId, x223003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223003_g_ScriptId, x223003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		if IsMissionHaveDone(sceneId, selfId, x223003_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223003_g_MissionId, x223003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223003_g_MissionId)
	for i, item in pairs(x223003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223003_g_DemandKill[1].num then
		if LuaFnGetItemCount(sceneId,selfId,x223003_g_DemandItem[1].id) == x223003_g_DemandItem[1].num then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223003_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x223003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223003_g_MissionId)
		AddExp(sceneId, selfId, x223003_g_ExpBonus)
		AddMoney(sceneId, selfId, x223003_g_MoneyBonus)
		for i, item in pairs(x223003_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x223003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x223003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223003_g_DemandKill[1].id then 
       		    if num < x223003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ쾫���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 if objdataId == x223003_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x223003_g_DemandItem[1].id) < x223003_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x223003_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�˳�����ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x223003_g_DemandItem[1].id)+1,x223003_g_DemandItem[1].num )) 
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

function x223003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223003_OnItemChanged(sceneId, selfId, itemdataId)

end

