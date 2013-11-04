--նɱ����

--MisDescBegin
x201008_g_ScriptId = 201008
x201008_g_MissionIdPre =91
x201008_g_MissionId = 90
x201008_g_MissionKind = 2
x201008_g_MissionLevel = 10
--x201008_g_ScriptIdNext = {ScriptId = 201001 ,LV = 1 }
x201008_g_Name	="����" 
x201008_g_DemandItem ={}
x201008_g_DemandKill ={{id=344,num=1}}

x201008_g_MissionName="նɱ����"
x201008_g_MissionInfo="    ��ľ��ĸ���Ҳ�ٸã��ǲ�ԭ�ϵ�Ӣ�ۣ����ò�ԭ���ͳ�����׷�ʽ�����˳��е�����ڭ���أ��������ľ���ĸ�ס�\n \n    ����������#R�Ѻ���#W���ǳ��еĸ�磬�����ű����������ɱ���ᣡ������ͷ�������̰�����ˡ�\n \n    �ҷ������Ѻ��ѵ��ټ�����������ɽ���µ�ĳ����"  --��������
x201008_g_MissionInfo2="����ȥɱ������"
x201008_g_MissionTarget="    #G����#W����ɱ��#G��Ӫ#W���������������#R�Ѻ���#W��"		                                                                                               
x201008_g_MissionComplete="    �������ƽ�ģ������������������ľ��͵Ϯ��Ҫ�����Ĵ��ۡ�"					--�������npc˵���Ļ�
x201008_g_ContinueInfo="    �Ѻ��������ǵ����죬�㲻�ܷŹ�����"
--������
x201008_g_MoneyBonus = 2
--�̶���Ʒ���������8��
x201008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201008_g_RadioItemBonus={}

--MisDescEnd
x201008_g_ExpBonus = 100
--**********************************

--������ں���

--**********************************

function x201008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201008_g_MissionId)
		if x201008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201008_g_MissionName)
			AddText(sceneId,x201008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���Ѻ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201008_g_MissionName)
		     AddText(sceneId,x201008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201008_g_MoneyBonus)
		     		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201008_g_ScriptId, x201008_g_MissionId)
                end

        elseif x201008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201008_g_MissionName)
                AddText(sceneId,x201008_g_MissionInfo..GetName(sceneId, selfId)..x201008_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201008_g_MoneyBonus)	
				EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201008_g_ScriptId, x201008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201008_g_ScriptId, x201008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
			if IsMissionHaveDone(sceneId, selfId, x201008_g_MissionIdPre) > 0 then
        	    	return 1
        end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x201008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201008_g_MissionId, x201008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201008_g_MissionId)
	for i, item in x201008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		                             
		ret = DelMission( sceneId, selfId, x201008_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x201008_g_MissionId )
				AddExp(sceneId, selfId, x201008_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x201008_g_MoneyBonus)
	   	end                                               
		
		--CallScriptFunction( x201008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	

	
end



--**********************************

--ɱ����������

--**********************************

function x201008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x201008_g_DemandKill[1].id then 
       		    if num < x201008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���Ѻ���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201008_OnItemChanged(sceneId, selfId, itemdataId)

end

