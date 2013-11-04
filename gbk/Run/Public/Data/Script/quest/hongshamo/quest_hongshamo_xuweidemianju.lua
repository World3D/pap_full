--��α�����

--MisDescBegin
x205008_g_ScriptId = 205008
--x205008_g_MissionIdPre =41
x205008_g_MissionId = 48
x205008_g_MissionKind = 11
x205008_g_MissionLevel = 55
--x205008_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x205008_g_Name	="ǧ��" 
x205008_g_DemandItem ={}
x205008_g_DemandKill ={{id=306,num=15}}

x205008_g_MissionName="��α�����"
x205008_g_MissionInfo="    ������֣���ն��ʹ����ʹ����ɣ�����������Ҳ��Ӧ�����������ǵ��̶ӣ����������������ģ����Ǵ��ųɼ�˼���Ǳ��컹�ߣ��ȱ����Ӻ���ˮ���峺���������ύ�����Ǿ�Ȼ�������Ǽ�ϸ����\n \n    "  --��������
x205008_g_MissionInfo2="�����������������˼���������������޼ɵ���һ������ɱ������ڣ���Ȼ���鵽������ز�������ֻ��һ���취�����Ǹ�����ƴ�ˣ������ǳ����ɼ�˼�����������������Ҫ��������һս�����ǽ����ڣ�182��203����Ӫ�ص�#R������ģ����#W��"
x205008_g_MissionTarget="    ����#Gǧ��#W�������ϲ�Ӫ�ص�15��#R������ģ����#W��"		                                                                                               
x205008_g_MissionComplete="    �ܺã����ǲ�ԭӢ�ۣ��͸�������������"					--�������npc˵���Ļ�
x205008_g_ContinueInfo="    �����ǣ������ǵ�������ʹ�����ɣ����ϲ�Ӫ�ص���Щ������ģ����������ĸ���"
--������
x205008_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205008_g_RadioItemBonus={}

--MisDescEnd
x205008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x205008_g_MissionId)
		if x205008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205008_g_MissionName)
			AddText(sceneId,x205008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ģ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205008_g_MissionName)
		     AddText(sceneId,x205008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x205008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205008_g_ScriptId, x205008_g_MissionId)
                end

        elseif x205008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205008_g_MissionName)
                AddText(sceneId,x205008_g_MissionInfo..GetName(sceneId, selfId)..x205008_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205008_g_ScriptId, x205008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205008_g_ScriptId, x205008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==5) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x205008_g_MissionId, x205008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x205008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x205008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205008_g_MissionId)
	for i, item in x205008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x205008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x205008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205008_g_MissionId)
		AddExp(sceneId, selfId, x205008_g_ExpBonus)
		AddMoney(sceneId, selfId, x205008_g_MoneyBonus)
		for i, item in x205008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x205008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205008_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x205008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x205008_g_DemandKill[1].id then 
       		    if num < x205008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ģ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x205008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205008_OnItemChanged(sceneId, selfId, itemdataId)

end

