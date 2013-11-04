--ҩ��

--MisDescBegin
x203012_g_ScriptId = 203012
--x203012_g_MissionIdPre =71
x203012_g_MissionId = 80
x203012_g_MissionKind = 13
x203012_g_MissionLevel = 50
--x203012_g_ScriptIdNext = {ScriptId = 203005 ,LV = 1 }
x203012_g_Name	="�ٲ�̨" 
x203012_g_DemandItem ={{id=13010022,num=1}}
x203012_g_noDemandKill ={{id=331,num=1}}	

x203012_g_MissionName="ҩ��"
x203012_g_MissionInfo="    ���Ǵ��ԭ�Ľ���������������ص��Ϲ������˰��̵�������������ħڭħ�����Ѿ���Զ�ˡ������Ѿ������µļƻ����õ��ϵ���Щʿ����кҩ��������һкǧ���������������Ȼ�����Ǵ���ɱ��ȥ��\n \n    ��˵���������������Ǹ����ˣ���������������£�������������Ⱥ�����æ����\n \n    <�ܱ�����͵Ц���ƺ�����������æ��һ���ܸ�Ц������>���ļƻ��Ѿ���ʼ�ˣ�����Ҫ��������ϡ�\n \n    �Ҳ���ˣ���Ⱥ�����������ӱ���ֻ��һ��ͻ����ʦ������ѧͽ��ҽ������Ҫ���������ϵ�ҩ�����������"  --��������
x203012_g_MissionTarget="    #G�ٲ�̨#W�������#Rͻ����ʦ#W��#c0080C0ҩ��#W��"		
x203012_g_MissionComplete="    ������ģ����Щ��ʿ֧�ֲ��˶�õģ����Ǻܿ���ܿ���ʤ������⡣"					--�������npc˵���Ļ�
x203012_g_ContinueInfo="    �Ը������£����������"
--������
x203012_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203012_g_RadioItemBonus={}

--MisDescEnd
x203012_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203012_g_MissionId) > 0 then
		if x203012_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x203012_g_MissionName)
			AddText(sceneId,x203012_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x203012_g_MissionTarget) 
			AddText(sceneId,format("\n    ҩ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203012_g_DemandItem[1].id),x203012_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x203012_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203012_g_MissionName)
		     AddText(sceneId,x203012_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x203012_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x203012_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203012_g_ScriptId, x203012_g_MissionId)
                end

        elseif x203012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203012_g_MissionName)
                AddText(sceneId,x203012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203012_g_ScriptId, x203012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203012_g_ScriptId, x203012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==3) then
        				return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203012_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x203012_g_MissionId, x203012_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x203012_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x203012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203012_g_MissionId)
	for i, item in x203012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203012_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x203012_g_DemandItem[1].id) == x203012_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203012_g_MissionId)
		AddExp(sceneId, selfId, x203012_g_ExpBonus)
		AddMoney(sceneId, selfId, x203012_g_MoneyBonus)
		for i, item in x203012_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203012_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203012_g_MissionId) >= 0 then                                       
       		 if objdataId == x203012_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x203012_g_DemandItem[1].id) < x203012_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x203012_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("ҩ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x203012_g_DemandItem[1].id)+1,x203012_g_DemandItem[1].num )) 
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

function x203012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x203012_OnItemChanged(sceneId, selfId, itemdataId)

end

