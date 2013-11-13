--��������������

--MisDescBegin
x201001_g_ScriptId = 201001
x201001_g_MissionIdPre =82
x201001_g_MissionId = 83
x201001_g_MissionKind = 2
x201001_g_MissionLevel = 10
x201001_g_ScriptIdNext = {ScriptId = 201002 ,LV = 1 }
x201001_g_Name	="��ľ��" 
x201001_g_DemandItem ={}
x201001_g_DemandKill ={{id=338,num=20}}
x201001_g_noDemandKill ={{id=339,num=1}}
x201001_g_DemandItem ={{id=13010024,num=1}}

x201001_g_MissionName="��������������"
x201001_g_MissionInfo="    <��ľ������ŭ��ֱð������͸�������ɱ��>��Щ�����޳ܵ��������͵Ϯ�����ǲ��䣬����ɱ�����ˣ�������ƥ�����������۰��������ö����������ˣ�\n \n    ���е�սʿ�ǣ������ǵ�ŭ���ȼ���ǵ����������Ǹ߹����ֵ����������ˣ�һ����������\n \n    ̤ƽ�����򲿣�����Ӫ�ı���ǰ������ƽ�����#R����������#W�������ǵ�ͷĿ��ͷ�����������"  --��������
x201001_g_MissionTarget="    ��#G��Ӫ�Ա�#Wǰ��������20��#R����������#B#aB{����������_1}[49,56]#aE#W����#R����������ͷĿ#B#aB{����������ͷĿ_2}[115,30]#aE#W����ͷ��#G��ľ��#B#aB{��ľ��_3}[79,128]#aE#W�������"		                                                                                               
x201001_g_MissionComplete="    ��ǿ�Ķ��֣���Ҳ������������������ľ��Ľ��¡�"					--�������npc˵���Ļ�
x201001_g_ContinueInfo="    ��������ɫ��������Щ����ֻ�����ǲ���һ����"


--�Զ�Ѱ·�Ķ���
x201001_g_AutoFindPath =  {{sid=1,x=49,z=56,speak=0},{sid=1,x=115,z=30,speak=0},{sid=1,x=79,z=128,speak=1}}

--������
x201001_g_MoneyBonus = 2
--�̶���Ʒ���������8��
x201001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201001_g_RadioItemBonus={}
--MisDescEnd
x201001_g_ExpBonus = 80

--**********************************

--������ں���

--**********************************

function x201001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201001_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201001_g_MissionId)
		if x201001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201001_g_MissionName)
			AddText(sceneId,x201001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201001_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ������������   %d/%d\n    ������ͷĿͷ­   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201001_g_DemandKill[1].num,LuaFnGetItemCount(sceneId,selfId,x201001_g_DemandItem[1].id),x201001_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201001_g_MissionName)
		     AddText(sceneId,x201001_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201001_g_ScriptId, x201001_g_MissionId)
                end

        elseif x201001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201001_g_MissionName)
                AddText(sceneId,x201001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201001_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201001_g_ScriptId, x201001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201001_g_ScriptId, x201001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
		if IsMissionHaveDone(sceneId, selfId, x201001_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201001_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201001_g_MissionId, x201001_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201001_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201001_g_MissionId)
	for i, item in pairs(x201001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201001_g_DemandKill[1].num then
			if LuaFnGetItemCount(sceneId,selfId,x201001_g_DemandItem[1].id) == x201001_g_DemandItem[1].num then
	        return 1
	    end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201001_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x201001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x201001_g_MissionId)
		AddExp(sceneId, selfId, x201001_g_ExpBonus)
		AddMoney(sceneId, selfId, x201001_g_MoneyBonus)
		for i, item in pairs(x201001_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x201001_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x201001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x201001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201001_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201001_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 	if objdataId == x201001_g_DemandKill[1].id then 
       		if num < x201001_g_DemandKill[1].num then
       		    	SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		      BeginEvent(sceneId)
			 					AddText(sceneId,format("ɱ������������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201001_g_DemandKill[1].num )) 
			 					EndEvent()
			 					DispatchMissionTips(sceneId, selfId)
		     end
      end
      if objdataId == x201001_g_noDemandKill[1].id then 
       		 if LuaFnGetItemCount(sceneId,selfId,x201001_g_DemandItem[1].id) < x201001_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	  BeginAddItem(sceneId)                                                    
				 							AddItem( sceneId,x201001_g_DemandItem[1].id, 1 )             
				 							ret = EndAddItem(sceneId,selfId)                                 
		        	 				if ret > 0 then                                                  
		        	 						BeginEvent(sceneId)
				 									AddText(sceneId,format("��������ͷͷ­   %d/%d", LuaFnGetItemCount(sceneId,selfId,x201001_g_DemandItem[1].id)+1,x201001_g_DemandItem[1].num )) 
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

function x201001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201001_OnItemChanged(sceneId, selfId, itemdataId)

end

