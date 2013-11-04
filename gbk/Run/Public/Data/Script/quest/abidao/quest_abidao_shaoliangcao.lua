--������

--MisDescBegin
x203010_g_ScriptId = 203010
x203010_g_MissionIdPre =77
x203010_g_MissionId = 78
x203010_g_MissionKind = 13
x203010_g_MissionLevel = 50
--x203010_g_ScriptIdNext = {ScriptId = 203010 ,LV = 1 }
x203010_g_Name	="�ٲ�̨"
x203010_g_Name2	="����" 
--x203010_g_noDemandItem ={{id=13010007,num=1}}
x203010_g_DemandKill ={{id=330,num=15}}	

x203010_g_MissionName="������"
x203010_g_MissionInfo="    �ã�̫���ˣ�û��ս�����ǵ�������޷��������ã����ǵ���һ��������Ҫ�������ǵ����֣�������û��������ս��\n \n    ���ֵ�λ�����Ѿ�������ˡ������������ֿɲ�ͬɱ����ô�򵥣�ħڭħ�����ָ����������������\n \n    ��������̫�٣����ܾ������������ˣ���Ҫ�ȰѸ�������15��#R���̵��ڱ�#W������ˣ��������֡�"  --��������
x203010_g_MissionTarget="    ��ɱ��15��#R���̵��ڱ�#W����ȼ#G����#WȻ��ص�#G�ٲ�̨#W����"		
x203010_g_MissionComplete="    ̫�����ˣ��ҿ����������ֵĴ���ˡ�"					--�������npc˵���Ļ�
x203010_g_ContinueInfo="    ������ȼ��С�ı��Է٣��Ͻ�ȥ�ɡ�"
--������
x203010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x203010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x203010_g_RadioItemBonus={}

--MisDescEnd
x203010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x203010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x203010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x203010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x203010_g_MissionId)
		if x203010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
			if (GetName(sceneId,targetId)==x203010_g_Name) then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x203010_g_MissionName)
				AddText(sceneId,x203010_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x203010_g_MissionTarget) 
				AddText(sceneId,format("\n    ɱ�����̵��ڱ�   %d/%d\n    �ջ�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0),x203010_g_DemandKill[1].num, GetMissionParam(sceneId,selfId,misIndex,1) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
		end

		     
                if x203010_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x203010_g_MissionName)
		     AddText(sceneId,x203010_g_MissionComplete)
		     AddMoneyBonus(sceneId, x203010_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x203010_g_ScriptId, x203010_g_MissionId)
                end

        elseif x203010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x203010_g_MissionName)
                AddText(sceneId,x203010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x203010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x203010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x203010_g_ScriptId, x203010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x203010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x203010_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x203010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x203010_g_ScriptId, x203010_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x203010_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x203010_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x203010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==3) then
        	 	if IsMissionHaveDone(sceneId, selfId, x203010_g_MissionIdPre) > 0 then
                    			return 1
                    	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x203010_OnAccept(sceneId, selfId)

	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x203010_g_MissionId, x203010_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x203010_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	
end



--**********************************

--����

--**********************************

function x203010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x203010_g_MissionId)
	for i, item in x203010_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x203010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x203010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x203010_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
	        	return 1
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x203010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x203010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x203010_g_MissionId)
		AddExp(sceneId, selfId, x203010_g_ExpBonus)
		AddMoney(sceneId, selfId, x203010_g_MoneyBonus)
		for i, item in x203010_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x203010_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x203010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x203010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x203010_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x203010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x203010_g_DemandKill[1].id then 
       		    if num < x203010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ�����̵��ڱ�   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x203010_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x203010_OnEnterArea(sceneId, selfId, zoneId)
	

end

function x203010_OnLeaveArea(sceneId, selfId )
	
end

function x203010_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x203010_OnItemChanged(sceneId, selfId, itemdataId)

end
