--�����ʺ�

--MisDescBegin
x204005_g_ScriptId = 204005
x204005_g_MissionIdPre =99
x204005_g_MissionId = 100
x204005_g_MissionKind = 9
x204005_g_MissionLevel = 45
x204005_g_ScriptIdNext = {ScriptId = 204006 ,LV = 1 }
x204005_g_Name	="�����ʺ�" 
x204005_g_Name2	="�ܱ�" 
x204005_g_DemandItem ={{id=13010033,num=1}}
--x204005_g_noDemandKill ={{id=301,num=1}}	

x204005_g_MissionName="�����ʺ�"
x204005_g_MissionInfo="    ���װ�����ʿ�����ڵȵ������ˣ����ս�������û�������ң��ܺã������ģ�\n \n   <˵�����ս�����ʱ�򣬻ʺ�����΢��>\n \n    �����ȥ���߹��ս��������ɹ����ܻ��������ɵ����ϣ�������ɼ�˼����æ���������������Թ���µ��˸��ϳ����ɹ���Ȼ�����������ҡ�\n \n    �����ҵ�����뽻���ܱ𽫾������ս�����������һ�����������ǵĻ���"  --��������
x204005_g_MissionTarget="    #G�����ʺ�#W�������������ȥ��#G�ܱ�#W��"		
x204005_g_MissionComplete="    ԭ��������ǰ����Ү��ֱ�Ļʺ�"					--�������npc˵���Ļ�
--x204005_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x204005_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x204005_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x204005_g_RadioItemBonus={}

--MisDescEnd
x204005_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x204005_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x204005_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x204005_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x204005_g_MissionName)
		     AddText(sceneId,x204005_g_MissionComplete)
		     AddMoneyBonus(sceneId, x204005_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x204005_g_ScriptId, x204005_g_MissionId)
                

        elseif x204005_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x204005_g_MissionName)
                AddText(sceneId,x204005_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x204005_g_MissionTarget) 
		AddMoneyBonus(sceneId, x204005_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x204005_g_ScriptId, x204005_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x204005_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x204005_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x204005_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x204005_g_ScriptId, x204005_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x204005_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204005_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x204005_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==4) then
        	if IsMissionHaveDone(sceneId, selfId, x204005_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x204005_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x204005_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x204005_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x204005_g_MissionId) > 0 then
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

function x204005_OnAccept(sceneId, selfId)

	                                                  
	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x204005_g_DemandItem[1].id, x204005_g_DemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x204005_g_MissionId, x204005_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x204005_g_MissionName) 
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

function x204005_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x204005_g_MissionId)
	for i, item in x204005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x204005_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x204005_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x204005_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x204005_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x204005_g_MissionId)
		AddExp(sceneId, selfId, x204005_g_ExpBonus)
		AddMoney(sceneId, selfId, x204005_g_MoneyBonus)
		for i, item in x204005_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x204005_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x204005_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x204005_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x204005_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x204005_OnItemChanged(sceneId, selfId, itemdataId)

end

